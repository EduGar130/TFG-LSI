import { TestBed } from '@angular/core/testing';
import { Router } from '@angular/router';
import { MarketingGuard } from './marketing.guard';
import { AuthService } from '../services/auth.service';

describe('MarketingGuard', () => {
  let guard: MarketingGuard;
  let authServiceSpy: jasmine.SpyObj<AuthService>;
  let routerSpy: jasmine.SpyObj<Router>;

  beforeEach(() => {
    authServiceSpy = jasmine.createSpyObj('AuthService', ['hasPermiso', 'logout']);
    routerSpy = jasmine.createSpyObj('Router', ['navigate']);

    TestBed.configureTestingModule({
      providers: [
        MarketingGuard,
        { provide: AuthService, useValue: authServiceSpy },
        { provide: Router, useValue: routerSpy }
      ]
    });

    guard = TestBed.inject(MarketingGuard);
  });

  it('debería permitir el acceso si tiene ambos permisos', () => {
    authServiceSpy.hasPermiso.withArgs('view_reports').and.returnValue(true);
    authServiceSpy.hasPermiso.withArgs('view_stats').and.returnValue(true);

    const result = guard.canActivate();
    expect(result).toBeTrue();
    expect(authServiceSpy.logout).not.toHaveBeenCalled();
    expect(routerSpy.navigate).not.toHaveBeenCalled();
  });

  it('debería denegar el acceso y redirigir si falta algún permiso', () => {
    authServiceSpy.hasPermiso.withArgs('view_reports').and.returnValue(true);
    authServiceSpy.hasPermiso.withArgs('view_stats').and.returnValue(false);

    const result = guard.canActivate();
    expect(result).toBeFalse();
    expect(authServiceSpy.logout).toHaveBeenCalled();
    expect(routerSpy.navigate).toHaveBeenCalledWith(['/']);
  });
});